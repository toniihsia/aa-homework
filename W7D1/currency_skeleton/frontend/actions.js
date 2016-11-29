const selectCurrency = (baseCurrency, rates) => ({
  type: 'SWITCH_CURRENCY',
  baseCurrency: baseCurrency,
  rates: rates
});

export default selectCurrency;
