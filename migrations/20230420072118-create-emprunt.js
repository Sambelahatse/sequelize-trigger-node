'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('emprunts', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
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
      dateRetour: {
        type: Sequelize.DATE
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
    await queryInterface.dropTable('emprunts');
  }
};