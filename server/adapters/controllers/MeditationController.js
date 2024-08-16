const GetAdviceByMood = require("../../applications/usecase/GetAdviceByMood");
const GetDailyQuotes = require("../../applications/usecase/GetDailyQuotes");
const GeminiApi = require("../../infrastructure/gemini/geminiServices");

class MeditationController{
    static async dailyQuote(req,res){
        try{
            const quotesRepository = new GeminiApi();
            const getDailyQuotes = new GetDailyQuotes(quotesRepository);
            const quotes = await getDailyQuotes.execute();
            res.json(quotes);
        } catch (e){
            res.status(500).json({error: e.message});
        }
    }

    static async myMood(req,res){
        try{
            const {mood} = req.params;
            const quotesRepository = new GeminiApi();
            const getAdviceByMood = new GetAdviceByMood(quotesRepository);
            const quotes = await getAdviceByMood.execute(mood);
            res.json(quotes);
        } catch (e){
            res.status(500).json({error: e.message});
        }
    }
}

module.exports = MeditationController;