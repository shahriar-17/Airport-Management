const express = require('express')
const router = express.Router()

router.get('/', (req,res)=>{  //user info
    res.send('new user info here')
})

router.post('/', (req,res)=>{  //user info
    res.send('new user info here')
})

module.exports = router