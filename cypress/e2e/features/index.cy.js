it('titles are correct', () => {
    const page = cy.visit("/");
  
    page.get('title').should('have.text', 'Ray')
    page.get('h1').should('have.text', "\nHello, I'm Ray.\n");
  });