$(function() {
  return $('#facility_postcode').jpostal({
    postcode: ['#facility_postcode'],
    address: {
      '#facility_prefecture_code': '%3',
      '#facility_address_city': '%4',
      '#facility_address_street': '%5%6%7',
    },
  });
});