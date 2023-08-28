const express = require('express')
const router = express.Router()


router.get('/', (req,res)=>{  //user info
    res.send('give locations here')
})

router.get('/seatplans', (req,res)=>{ 
    res.send('select seat from selected date')
})

router.get('/purchase', (req,res)=>{ 
    res.send('purchase tickets here')
})

router.get('/download', (req,res)=>{ 
    res.send('download tickets here')
})

module.exports = router