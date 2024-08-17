const expres = require('express');
const meditationRoutes = require('./adapters/routes/meditationRoutes');
const songRoutes = require('./adapters/routes/songRoutes');

const app = expres();
const port = 6000;

app.use('/meditation',meditationRoutes);
app.use('/songs',songRoutes);

app.listen(port, () => {
    console.log('Server is running on port ', port);
})