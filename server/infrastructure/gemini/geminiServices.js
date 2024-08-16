const {GoogleGenerativeAI} = require('@google/generative-ai');
const QuotesRepository = require("../../applications/interface/QuotesRepository");

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
        const promt = `Given the current mood of the user, provide an appropriate meditation advice or mental health exercise. The possible result could be as such {"advice": "specific advice or exercise based on the user's mood "} For example if the user' mood is "happy", the response should be : {"advice": "Engage in a particular practice by listing three things you are thankful for today. This will help you sustan your positive mood},So the mood is: ${mood} return the json only without using json keyword`;
        const result = await model.generateContent(promt);
        const response = await result.response;
        const text = response.text();
        return text;
    }
}