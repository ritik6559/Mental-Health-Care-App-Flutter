const GetSongs = require("../../applications/usecase/GetSongs");

class SongController {
    static async all(req,res){
        try{
            const getSongs = new GetSongs();
            const songs = await getSongs.execute();
            res.json(songs);
        } catch (e){
            res.status(500).json({error: e.message});
        }
    }
}

module.exports = SongController;