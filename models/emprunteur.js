'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Emprunteur extends Model{

    static associate(models) {
      // define association here
    }

  }
  Emprunteur.init({
    ID: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    NomEmprunteur: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    PrenomEmprunteur: {
      type: DataTypes.STRING(100),
      allowNull: true
    },
    AdresseEmprunteur: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    TelephoneEmprunteur: {
      type: DataTypes.STRING(15),
      allowNull: false
    },
    EmailEmprunteur: {
      type: DataTypes.STRING(100),
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'Emprunteur',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "ID" },
        ]
      },
    ]
  });
  return Emprunteur;

};
