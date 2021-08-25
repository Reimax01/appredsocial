const { Pool } = require('pg');

const pool = new Pool({
    
    host: 'localhost',
    user: 'postgres',
    password: 'Rei01071009!',
    database: 'proyecto_red_social',
    port: '5432'
    
});
module.exports=pool;