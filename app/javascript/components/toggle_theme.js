const toggleTheme = () => {
  document.querySelector('#theme-toggle').addEventListener('click', () => {
    document.querySelector('#theme-link').click();
  });
};

export { toggleTheme };
