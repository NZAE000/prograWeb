const clientsModel = require("../models/clients.model");

module.exports = {
    get : async (req, res) => {
        let listClients = await clientsModel.list();
        res.render("clients", { 
           lista: listClients,
           type: "LISTA",
        });
    },
}