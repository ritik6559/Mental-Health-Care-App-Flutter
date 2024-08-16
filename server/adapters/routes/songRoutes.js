const expres = require("express");
const SongController = require("../controllers/SongController");
const router = expres.Router();



router.get('/all',SongController.all);


module.exports = router;