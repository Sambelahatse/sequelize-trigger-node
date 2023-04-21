'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('emprunt_audits', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      idEmprunt: {
        type: Sequelize.INTEGER
      },
      idExemplaire: {
        type: Sequelize.INTEGER
      },
      idEmprunteur: {
        type: Sequelize.INTEGER
      },
      nombreEmprunt: {
        type: Sequelize.INTEGER
      },
      dateEmprunt: {
        type: Sequelize.DATE
      },
      AncienDateRetour: {
        type: Sequelize.DATE
      },
      NouvelDateRetour: {
        type: Sequelize.DATE
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
    await queryInterface.dropTable('emprunt_audits');
  }
};