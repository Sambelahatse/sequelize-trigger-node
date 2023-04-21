'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('emprunteur_audits', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      idEmprunteur: {
        type: Sequelize.INTEGER
      },
      ancienNom: {
        type: Sequelize.STRING
      },
      nouveauNom: {
        type: Sequelize.STRING
      },
      action: {
        type: Sequelize.STRING
      },
      date: {
        type: Sequelize.DATE
      },
      utilisateur: {
        type: Sequelize.STRING
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('emprunteur_audits');
  }
};