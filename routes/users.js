const express = require('express')
const router = express.Router()
const oracledb = require('oracledb');

const dbConfig = {
  user          : "Airport_Management_System",
  password      : "123", 
  connectString : "localhost:1522/orclpdb"
};

router.use(express.urlencoded({ extended: true }));

// router.post('/',(req,res)=>{
//     const loginID = req.body.loginID;
//     const Password = req.body.Password;
//     console.log(loginID,Password)
//     res.render('users',{loginID, Password})
// })


router.get('/:id', (req, res) => {
    req.params.id
    res.send(`get users id: ${req.params.id} info`)
})

module.exports = router
