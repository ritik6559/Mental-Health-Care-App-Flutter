const Song = require("../../domain/entities/song");
const { getAllSongs } = require("../../infrastructure/db/queries/songQueries");
const Usecaseinterface = require("../interface/UseCaseInterface");

class GetSongs extends Usecaseinterface{
    async execute(){
        const songRows = await getAllSongs();
        return songRows.map(song => new Song({
            id: song.id,
            title: song.title,
            author: song.author,
            songLink: song.songLink,
        }));
    }
}

module.exports = GetSongs;