const express = require('express')
const router = express.Router()
router.use(express.urlencoded({ extended: true }));


//admin pageo
router.post('/', (req,res)=>{
    const ID = req.body.ID;
    const Password = req.body.password;
    const SecurityCode = req.body.securitycode;
    console.log(ID,Password,SecurityCode)
    res.render('admin',{ID, Password, SecurityCode})
})


// app.post('/admin', async (req,res)=>{  //send to admin page
//     const {ID, Password, SecurityCode} = req.body
//     console.log(req.body)
//     try {
//         const connection = await oracledb.getConnection(dbConfig);
//         const result = await connection.execute(
            
//             `SELECT COUNT(*) AS COUNTER FROM Employees e JOIN LoginAsAdmin l ON e.ID = l.ID WHERE l.ID=:ID AND l.Password =:Password AND l.SecurityCode =:SecurityCode`,
//             { ID, Password, SecurityCode }
//         );
           
//         if (true) {
//             console.log("working");
//             res.render('admin',{ ID, Password, SecurityCode })
    
//         } else {
//             console.log("Not_ working");
//             res.render('admin_login');
//         }
    
//         await connection.close();
    
//     } catch (error) {
//         console.error('Error:', error);
//         res.render('admin_login'); // Redirect on error
//     }

//     res.render('admin',{user: 'Admin'})
// })


router.get('/tab1', (req,res)=>{ 
    res.send('tab1 here')
})

router.get('/tab2', (req,res)=>{ 
    res.send('tab2 here')
})

module.exports = router