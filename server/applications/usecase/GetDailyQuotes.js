const Meditation = require("../../domain/entities/meditation");
const Usecaseinterface = require("../interface/UseCaseInterface");

class GetDailyQuotes extends Usecaseinterface{
    constructor(quotesRepository){
        super();
        this.quotesRepository = quotesRepository;
    }

    async execute(){
        const quotesData = await this.quotesRepository.getDailyQuotes();
        return new Meditation({text: quotesData});
    }
}

module.exports = GetDailyQuotes;