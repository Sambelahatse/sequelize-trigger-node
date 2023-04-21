'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class livre_audit extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  livre_audit.init({
    idLvre: DataTypes.INTEGER,
    ancienTitreLivre: DataTypes.STRING,
    nouvelTitreLivre: DataTypes.STRING,
    action: DataTypes.STRING,
    date: DataTypes.DATE,
    utilisateur: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'livre_audit',
  });
  return livre_audit;
};