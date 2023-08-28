const express = require('express')
const oracledb = require('oracledb');
const ejs = require('ejs');
const app = express()
const bodyParser = require('body-parser');



const userRouter = require('./routes/users')
const adminRouter = require('./routes/admin')
const buyRouter = require('./routes/buy')
const registerRouter = require('./routes/register')

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

app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use(bodyParser.urlencoded({ extended: true }));

//Home page
app.get('/', (req, res) => {
    res.render("index", { text: 'world ' })
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
app.post('/admin', async (req,res)=>{  //send to admin page
    const {ID, Password, SecurityCode} = req.body
    console.log(req.body)
    try {
        const connection = await oracledb.getConnection(dbConfig);
        const result = await connection.execute(
            
            `SELECT COUNT(*) AS COUNTER FROM Employees e JOIN LoginAsAdmin l ON e.ID = l.ID WHERE l.ID=:ID AND l.Password =:Password AND l.SecurityCode =:SecurityCode`,
            { ID, Password, SecurityCode }
        );
           
        if (true) {
            console.log("working");
            res.render('admin',{ ID, Password, SecurityCode })
    
        } else {
            console.log("Not_ working");
            res.render('admin_login');
        }
    
        await connection.close();
    
    } catch (error) {
        console.error('Error:', error);
        res.render('admin_login'); // Redirect on error
    }

    res.render('admin',{user: 'Admin'})
})

//Varification after reg
// app.post('/varification', (req, res) => {
//     const F_name = req.body.first_name
//     const l_name = req.body.last_name
//     const email = req.body.email
//     const password = req.body.password;
//     console.log(F_name, l_name, email, password)
//     res.render('varification')
// })

app.post('/varification', async (req, res) => {
    const F_name = req.body.first_name;
    const l_name = req.body.last_name;
    const email = req.body.email;
    const password = req.body.password;
    const age = 20;
    const address = 'aaa';
    try {
        const connection = await oracledb.getConnection(dbConfig);
        const getMaxIdQuery = `SELECT MAX(ID) AS MAX_ID FROM Passenger`;
        const result = await connection.execute(getMaxIdQuery);
        const maxId = result.rows[0].MAX_ID || 0; // If there are no records, set it to 0
       // let maxId = 100;
       
        const newId = maxId + 1;

        const insertQuery = `
            INSERT INTO Passenger (ID, First_Name, Last_Name,Age, Email, Address)
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


//Edit profile
app.get('/editprofile', (req, res) => {
    res.render('editprofile')
})

// ---- here get all the info from edit profile and update the database ---//
// router.post('/',(res,req)=>{
//     //read all the info from edit profile and add the to database
// })

//Purchase Ticket
app.get('/purchaseticket', (req, res) => {
    res.render('purchaseticket')
})

//Seat plan page
app.post('/seatplan', (req, res) => {
    res.render('seatplan')
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

app.listen(3000)