const expres = require("express");
const MeditationController = require("../controllers/MeditationController");

const router = expres.Router();

router.get('/dailyQuote',MeditationController.dailyQuote);
router.get('/myMood/:mood',MeditationController.myMood);

module.exports = router;