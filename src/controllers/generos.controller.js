const conexion = require('./conexionDB')
const generos = {};
generos.getGeneros = async (req, res) => {
    const response = await conexion.query("select * from genero");
    console.log(response);
    res.status(200).json(response.rows);
}
module.exports = generos;
