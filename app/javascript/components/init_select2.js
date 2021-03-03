import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  for (var i =  15; i >= 1; i--) {
    $(`#select2-${i}`).select2({ width: '100%' });
  }
};

export { initSelect2 };
