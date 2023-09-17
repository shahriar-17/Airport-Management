const express = require('express')
const oracledb = require('oracledb');
const ejs = require('ejs');
const app = express()
const bodyParser = require('body-parser');
app.use(bodyParser.json());


const userRouter = require('./routes/users')
const adminRouter = require('./routes/admin')
const buyRouter = require('./routes/buy')
const registerRouter = require('./routes/register')

var verificationCode = '123456';

app.set('view engine', 'ejs')

app.use('/users', userRouter)
app.use('/admin', adminRouter)
app.use('/buy', buyRouter)
app.use('/register', registerRouter)
app.use(express.json());

const dbConfig = {
    user: "Airport_Management_System",
    password: "123",  // contains the hr schema password
    connectString: "localhost:1521/orclpdb"
};

const nodemailer = require('nodemailer');
const smtpTransport = require('nodemailer-smtp-transport');

// Create a transporter using Gmail SMTP and environment variables
const transporter = nodemailer.createTransport(
    smtpTransport({
        host: 'smtp.gmail.com',
        port: 587, // Replace with your SMTP server's port
        secure: false, // Use true if your server uses SSL/TLS
        auth: {
            user: 'takyshahriar@gmail.com',
            pass: 'ofyxnjidrxnfqqwg',
        },
    })
);


app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));

//Home page
app.get('/', (req, res) => {
    res.render("index", { text: 'world ' })
})

app.get('/contact', (req, res) => {
    res.render('contact')
})

app.get('/service', (req, res) => {
    res.render('service')
})

//Log in page
app.get('/login_reg', (req, res) => {  //login or reg info
    res.render("login_reg")
})

//user page
app.post('/users', async (req, res) => {
    const { loginID, Password } = req.body
    console.log(req.body)
    try {
        const connection = await oracledb.getConnection(dbConfig);
        const query = `
            SELECT p.ID, p.First_Name, p.Last_Name, p.Age, p.Email, p.Address
            FROM Passenger p
            JOIN LoginPsngr l ON p.ID = l.ID
            WHERE l.ID = :loginID AND l.Password = :Password
        `;
        const result = await connection.execute(query, { loginID, Password }, { outFormat: oracledb.OUT_FORMAT_OBJECT });

        if (result.rows.length != 0) {
            console.log("working");
            console.log(result.rows[0])
            res.render('users', { user: result.rows[0] });

        } else {
            console.log("Not_ working");
            res.render('login_reg');
        }

        await connection.close();

    } catch (error) {
        console.error('Error:', error);
        res.render('login_reg'); // Redirect on error
    }

})

// admin log in page
app.get('/admin_login', (req, res) => {  //admin login
    res.render("admin_login")
})

//Admin info
app.post('/admin', async (req, res) => {
    const { ID, password, securitycode } = req.body;
    console.log('ID:', ID);
    console.log('Password:', password);
    console.log('SecurityCode:', securitycode);

    try {
        const connection = await oracledb.getConnection(dbConfig);

        // First, check if the credentials match
        const loginQuery = `
            SELECT COUNT(*) AS COUNTER 
            FROM Admins e 
            JOIN LoginAsAdmin l ON e.ID = l.ID 
            WHERE l.ID = :ID AND l.Password = :password AND l.SecurityCode = :securitycode
        `;
        const loginResult = await connection.execute(loginQuery, { ID, password, securitycode });

        if (loginResult.rows[0].length > 0) {
            // Credentials match, now fetch additional admin information
            const adminQuery = `
                SELECT a.ID, a.First_Name, a.Last_Name, a.Salary, a.Email, a.Address
                FROM Admins a
                WHERE a.ID = :ID
            `;
            const adminResult = await connection.execute(adminQuery, { ID }, { outFormat: oracledb.OUT_FORMAT_OBJECT });
            console.log(adminResult.rows[0]);
            if (adminResult.rows.length > 0) {
                console.log("Login successful");
                res.render('admin', { admin: adminResult.rows[0] });
            } else {
                console.log("Admin not found");
                res.render('admin_login');
            }
        } else {
            console.log("Login failed");
            res.render('admin_login');
        }

        await connection.close();
    } catch (error) {
        console.error('Error:', error);
        res.render('admin_login'); // Redirect on error
    }
});

app.get('/management', (req, res) => {
    res.render('management');
})


//admin-money
app.get('/money', async (req, res) => {
    try {
        const connection = await oracledb.getConnection(dbConfig);
        const debit1 = await connection.execute(`SELECT TOTAL_DEBIT(1) FROM DUAL`);
        const debit = debit1.rows[0][0];
        const credit1 = await connection.execute(`SELECT TOTAL_CREDIT(1) FROM DUAL`);
        const credit = credit1.rows[0][0];
        const profit = credit - debit;
        res.render('money', { debit, credit, profit });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Internal Server Error');
    }
});
//admin-employee

app.get('/employee', async (req, res) => {
    try {
        const connection = await oracledb.getConnection(dbConfig);
        const query = 'SELECT * FROM Employees ORDER BY ID';
        const result = await connection.execute(query);
        await connection.close();
        //console.log(result.rows);
        //retrieved passenger data to the search.ejs template
        res.render('employee', { passengers: result.rows });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Internal Server Error');
    }
});

//admin-employee-delete
app.post('/delete', async (req, res) => {
    const { id } = req.body;

    let connection;

    try {
        connection = await oracledb.getConnection(dbConfig);
        await connection.execute(`DELETE FROM Employees WHERE ID =:id`, { id });
        await connection.commit();
        console.log(id);
        res.redirect('/employee');
    } catch (error) {
        console.error('Error deleting record:', error);
        res.redirect('/employee');
    } finally {
        if (connection) {
            try {
                await connection.close();
            } catch (err) {
                console.error('Error closing connection:', err);
            }
        }
    }
});

// Edit Passenger

app.post('/editprofile', (req, res) => {
    const { id } = req.body;
    res.render('editprofile', { id })
})

app.post('/updateuser', async (req, res) => {
    const { id, first_name, last_name, age, email, address } = req.body;
    connection = await oracledb.getConnection(dbConfig);

    try {
        await connection.execute(`
            UPDATE Passenger
            SET First_Name = :first_name,
                Last_Name = :last_name,
                Age =: age,
                Email = :email,
                Address = :address
            WHERE Id = :id`,
            { id, first_name, last_name, age, email, address }
        );
        await connection.commit();
        res.redirect('/login_reg');

    } catch (error) {
        // Handle errors here
        console.error(error);
        res.status(500).send('Error updating employee information');
    } finally {
        connection.close(); // Close the database connection
    }
})

//Edit Employee

app.post('/editemployee', (req, res) => {
    const { id } = req.body;
    console.log(id);
    res.render('editemployee', { id })
})

app.post('/updateinfo', async (req, res) => {
    const { id, first_name, last_name, salary, email, address } = req.body;
    connection = await oracledb.getConnection(dbConfig);

    try {
        await connection.execute(`
            UPDATE Employees
            SET First_Name = :first_name,
                Last_Name = :last_name,
                Salary = :salary,
                Email = :email,
                Address = :address
            WHERE Id = :id`,
            { id, first_name, last_name, salary, email, address }
        );

        await connection.commit();
        res.redirect('/employee');
    } catch (error) {
        // Handle errors here
        console.error(error);
        res.status(500).send('Error updating employee information');
    } finally {
        connection.close(); // Close the database connection
    }
})

app.get("/search", (req, res) => {
    res.render('search');
});

app.get("/getFlightInfo", async (req, res) => {

    const { flightNumber, timeRange } = req.query;
    //console.log(flightNumber,timeRange)
    try {
        const connection = await oracledb.getConnection(dbConfig);
        const location = await connection.execute(`SELECT FIND_PLANE(:flightNumber,:timeRange) FROM DUAL`, { flightNumber, timeRange });
        res.json(location.rows[0][0]);
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Internal Server Error');
    }
});

app.get("/airport", (req, res) => {
    res.render('airport');
});

app.get('/getplanes', async (req, res) => {
    const airportName = req.query.airportName;
    try {
        const connection = await oracledb.getConnection(dbConfig);
        const airport = await connection.execute(`SELECT Total_Flight, Name, ID, City, Totalcapacity, Country FROM Airport WHERE Name=:airportName`, { airportName });
        res.json(airport.rows[0]);
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Internal Server Error');
    }
});




app.post('/varification', async (req, res) => {
    const F_name = req.body.first_name;
    const l_name = req.body.last_name;

    const email = req.body.email;
    console.log(email)
    sendVerificationEmail(email);

    const password = req.body.password;
    const age = 20;
    const address = 'aaa';
    try {
        const connection = await oracledb.getConnection(dbConfig);
        const getMaxIdQuery = `SELECT MAX(ID) AS MAX_ID FROM Passenger`;
        const result = await connection.execute(getMaxIdQuery);
        let maxId = result.rows[0][0];

        const newId = maxId + 1; // Increment maxId by 1

        const insertQuery = `
    INSERT INTO Passenger (ID, First_Name, Last_Name, Age, Email, Address)
    VALUES (:newId, :F_name, :l_name, :age, :email, :address)
`;
        const bindParams = {
            newId,
            F_name,
            l_name,
            age,
            email,
            address
        };
        console.log(bindParams)
        await connection.execute(insertQuery, bindParams, { autoCommit: true });
        await connection.close();

        console.log(`New passenger with ID ${newId} inserted successfully.`);
        res.render('varification');
    } catch (error) {
        console.error('Error:', error);
        res.render('varification'); // Redirect on error
    }
});

// Handle the POST request to verify the code
app.post('/verify-code', (req, res) => {
    const userEnteredCode = req.body.code; // Get the code entered by the user
    verificationCode = userEnteredCode
    const correctVerificationCode = verificationCode;

    if (userEnteredCode === correctVerificationCode) {
        // Code is valid
        res.json({ valid: true });
    } else {
        // Code is invalid
        res.json({ valid: false });
    }
});



//Edit profile
app.get('/editprofile', (req, res) => {
    res.render('editprofile')
})



//Purchase Ticket
app.get('/purchaseticket', (req, res) => {
    res.render('purchaseticket')
})

//Seat plan page
app.post('/seatplan', async (req, res) => {
    try {
        const { source, destination, flightDate } = req.body;
        const connection = await oracledb.getConnection(dbConfig);
        const query = `
            SELECT *
            FROM TICKET
            WHERE SOURCE = :source
              AND DESTINATION = :destination
              AND FLIGHT_DATE = TO_DATE(:flightDate, 'YYYY-MM-DD')
        `;
        const result = await connection.execute(query, {
            source,
            destination,
            flightDate,
        });

        if (result.rows.length > 0) {
            // Available tickets found
            res.status(200).json({ availableTickets: true, seatData: result.rows[0] });
        } else {
            // No available tickets
            res.status(200).json({ availableTickets: false });
        }
    } catch (error) {
        console.error('Error:', error);
        res.status(500).send('Error occurred while processing your request.');
    }
});

app.get('/seatplan', (req, res) => {
    res.render('seatplan');
})

// Purchasing page
app.get('/explore', (req, res) => {
    res.render('explore', {})
})

//Download ticket page
app.get('/download-file', (req, res) => {
    const filePath = '/js/script.js';
    res.download(filePath, '/js/script.js');
});

function sendVerificationEmail(emailAddress) {
    // Generate a random verification code 
    const verificationCode = Math.floor(100000 + Math.random() * 900000);

    // Create the email content
    const mailOptions = {
        from: 'takyshahriar@gmail.com',
        to: emailAddress,
        subject: 'Verification Code',
        text: `Your Verification Code is ${verificationCode}`,
    };

    // Send the email
    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.error('Error sending email:', error);
        } else {
            console.log('Email sent:', info.response);
        }
    });
}


app.listen(3000)

