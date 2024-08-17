const {GoogleGenerativeAI} = require('@google/generative-ai');
const QuotesRepository = require("../../applications/interface/QuotesRepository");
const API = require('../../secrets')

const genAi = new GoogleGenerativeAI("API_KEY");
const model = genAi.getGenerativeModel({model:'gemini-1.5-pro'});

class GeminiApi extends QuotesRepository{

    async getDailyQuotes(){
        const promt = 'Please provide three inspirational quotes for meditation, one for each part of the day: morning, noon and evening. Return the response in JSON format with the following structure:{"morningQuote": "Your morning quote here", "noonQuote": "Your noon quote here","eveningQuote": "Your evening quote here",} return the json only without using keyword json';
        const result = await model.generateContent(promt);
        const response = await result.response;
        const text = response.text();
        return text;
    }

    async getAdviceByMood(mood){
        const promt = `You will be provided with the mood of the user and you are required to give an advice to the user based on their mood, your response should be of the format
        {
        "advice": "specific advice or exercise based on the user's mood "
        } ,
        you should return the output without any json keyword and ,
        now give me an advice if my mood is ${mood} adn remove`;
        const result = await model.generateContent(promt);
        const response = await result.response;
        const text = response.text();
        return text;
    }
}

module.exports = GeminiApi;

