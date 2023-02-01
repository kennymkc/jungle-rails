describe('add to cart', () => {

  it('renders the homepage', () => {
    cy.visit('/');
  });

  it('should increase cart count by 1 when add button is clicked', () => {
    cy.contains('My Cart (0)').should('be.visible');
    cy.contains('Add').click({ force: true });
    cy.contains('My Cart (1)').should('be.visible');
  })

})