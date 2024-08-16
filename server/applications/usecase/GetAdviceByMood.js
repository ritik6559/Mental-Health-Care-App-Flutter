const Usecaseinterface = require("../interface/UseCaseInterface");

class GetAdviceByMood extends Usecaseinterface{
    constructor(quotesRepository){
        super();
        this.quotesRepository = quotesRepository;
    }

    async execute(mood){
        const quotesData = await this.quotesRepository.getAdviceByMood(mood);
        return new Meditation({text: quotesData});
    }
}

module.exports = GetAdviceByMood;