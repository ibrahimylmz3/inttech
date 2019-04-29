const path = require('path');
const express = require('express');
const hbs = require('hbs');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const app = express();
const port = 80;


//veritabanı bağlantısı
const conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'node'
});

//veritabanı bağlantısı kontrolü
conn.connect((err) => {
    if (err) throw err;
    console.log('Veritabanına bağlantı sağlandı...');
});

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use('/assets', express.static(__dirname + '/public'));

//Giriş Sayfası
app.get('/', (req, res) => {
        res.render('index');
    });
    
//MuzikTur Select
app.get('/muziktur', (req, res) => {
    let sql = "SELECT * FROM muziktur";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.render('muzik', {
            results: results
        });
    });
});

//MuzikTurk Ekle
app.post('/muzikturadd', (req, res) => {
    let data = {MuzikTur: req.body.MuzikTur};
    let sql = "INSERT INTO muziktur SET ?";
    let query = conn.query(sql, data, (err, results) => {
        if (err) throw err;
        res.redirect('/muziktur');
    });
});

//MuzikTurk Düzenle
app.post('/muzikturupdate', (req, res) => {
    let sql = "UPDATE muziktur SET MuzikTur='" + req.body.MuzikTur + "' WHERE MuzikTurId=" + req.body.MuzikTurId;
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.redirect('/muziktur');
    });
});

//MuzikTurk Sil
app.post('/muzikturdelete', (req, res) => {
    let sql = "DELETE FROM muziktur WHERE MuzikTurId=" + req.body.MuzikTurId + "";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.redirect('/muziktur');
    });
});

//Sanatci Select
app.get('/sanatci', (req, res) => {
    let sql = "SELECT * FROM sanatci";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.render('sanatci', {
            results: results
        });
    });
});

//Sanatci Ekle
app.post('/sanatciadd', (req, res) => {
    let data = {SanatciAdi: req.body.SanatciAdi, SanatciYasiyormu: req.body.SanatciYasiyormu, SanatciDogumTarihi: req.body.SanatciDogumTarihi};
    let sql = "INSERT INTO sanatci SET ?";
    let query = conn.query(sql, data, (err, results) => {
        if (err) throw err;
        res.redirect('/sanatci');
    });
});

//Sanatci Düzenle
app.post('/sanatciupdate', (req, res) => {
    let sql = "UPDATE sanatci SET SanatciAdi='" + req.body.SanatciAdi + "', SanatciYasiyormu='" + req.body.SanatciYasiyormu + "', SanatciDogumTarihi='" + req.body.SanatciDogumTarihi + "' WHERE SanatciId=" + req.body.SanatciId;
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.redirect('/sanatci');
    });
});

//Sanatci Sil
app.post('/sanatcidelete', (req, res) => {
    let sql = "DELETE FROM sanatci WHERE SanatciId=" + req.body.SanatciId + "";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.redirect('/sanatci');
    });
});

//Albüm Select
app.get('/album', (req, res) => {
    let sql = "SELECT * FROM album";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.render('album', {
            results: results
        });
    });
});

//Albüm Ekle
app.post('/albumadd', (req, res) => {
    let data = {AlbumAdi: req.body.AlbumAdi, CikisTarihi: req.body.CikisTarihi, SanatciId: req.body.SanatciId, MuzikTurId: req.body.MuzikTurId};
    let sql = "INSERT INTO album SET ?";
    let query = conn.query(sql, data, (err, results) => {
        if (err) throw err;
        res.redirect('/album');
    });
});

//Albüm Düzenle
app.post('/albumupdate', (req, res) => {
    let sql = "UPDATE album SET AlbumAdi='" + req.body.AlbumAdi + "', CikisTarihi='" + req.body.CikisTarihi + "', SanatciId='" + req.body.SanatciId + "', MuzikTurId='"+ req.body.MuzikTurId +"' WHERE AlbumId=" + req.body.AlbumId;
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.redirect('/album');
    });
});

//Albüm Sil
app.post('/albumdelete', (req, res) => {
    let sql = "DELETE FROM album WHERE AlbumId=" + req.body.AlbumId + "";
    let query = conn.query(sql, (err, results) => {
        if (err) throw err;
        res.redirect('/album');
    });
});


//dinlenen port
app.listen(port, () => {
    console.log('Localhost bağlantısı sağlandı. Dinlenen port: ' + port);
});
