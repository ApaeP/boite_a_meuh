const toggleTheme = () => {
  if (document.querySelector('#theme-toggle')) {
    document.querySelector('#theme-toggle').addEventListener('click', () => {
      document.querySelector('#theme-link').click();
    });
  };
};

export { toggleTheme };
