'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class exemplaire_audit extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  exemplaire_audit.init({
    idExemplaire: DataTypes.INTEGER,
    ancienNombre: DataTypes.INTEGER,
    nouveauNombre: DataTypes.INTEGER,
    action: DataTypes.STRING,
    date: DataTypes.DATE,
    utilisateur: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'exemplaire_audit',
  });
  return exemplaire_audit;
};