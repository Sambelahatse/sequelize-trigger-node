var DataTypes = require("sequelize").DataTypes;
var _emprunt = require("./emprunt");
var _emprunteur = require("./emprunteur");
var _exemplaire = require("./exemplaire");
var _livre = require("./livre");

function initModels(sequelize) {
  var emprunt = _emprunt(sequelize, DataTypes);
  var emprunteur = _emprunteur(sequelize, DataTypes);
  var exemplaire = _exemplaire(sequelize, DataTypes);
  var livre = _livre(sequelize, DataTypes);

  emprunteur.belongsToMany(exemplaire, { as: 'ExemplaireID_exemplaires', through: emprunt, foreignKey: "EmprunteurID", otherKey: "ExemplaireID" });
  exemplaire.belongsToMany(emprunteur, { as: 'EmprunteurID_emprunteurs', through: emprunt, foreignKey: "ExemplaireID", otherKey: "EmprunteurID" });
  emprunt.belongsTo(emprunteur, { as: "Emprunteur", foreignKey: "EmprunteurID"});
  emprunteur.hasMany(emprunt, { as: "emprunts", foreignKey: "EmprunteurID"});
  emprunt.belongsTo(exemplaire, { as: "Exemplaire", foreignKey: "ExemplaireID"});
  exemplaire.hasMany(emprunt, { as: "emprunts", foreignKey: "ExemplaireID"});
  exemplaire.belongsTo(livre, { as: "Livre", foreignKey: "LivreID"});
  livre.hasMany(exemplaire, { as: "exemplaires", foreignKey: "LivreID"});

  return {
    emprunt,
    emprunteur,
    exemplaire,
    livre,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
