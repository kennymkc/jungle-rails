describe('product page', () => {

  it('renders the homepage', () => {
    cy.visit('/');
  });

  it('should render a product detail page when product is clicked', () => {
    cy.get('.products article:first').click();
    cy.get('.product-detail').should('be.visible');
  });

})