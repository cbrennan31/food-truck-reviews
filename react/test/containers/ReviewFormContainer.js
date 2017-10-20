import ReviewForm from '../../src/components/ReviewForm';
import ReviewFormContainer from '../../src/containers/ReviewFormContainer';
import { mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';

describe('ReviewFormContainer', () => {
  let wrapper, handleSubmit;

  beforeEach(() => {
    jasmineEnzyme();
    handleSubmit = jasmine.createSpy('handleSubmit spy');
    wrapper = mount(<ReviewFormContainer
      handleSubmit = {handleSubmit}
    />);
  });

  it('should have the specified initial state', () => {
    expect(wrapper.state()).toEqual({
      ratingErrors: '',
      rating: null,
      description: ''
    });
  });

  it('should render a ReviewForm component with props', () => {
    expect(wrapper.find(ReviewForm)).toBePresent();
    expect(wrapper.find(ReviewForm).props()).toEqual({

      handleClearForm: jasmine.any(Function),
      handleSubmit: jasmine.any(Function),
      handleRatingChange: jasmine.any(Function),
      rating: wrapper.state().rating,
      description: wrapper.state().description,
      handleDescriptionChange: jasmine.any(Function)
    });
  });

  it('should submit a new review', () => {

    let form = wrapper.find(ReviewForm).find('form');

    form.simulate('submit')

    expect(wrapper.find(ReviewForm)).toBePresent();
    // how to simulate fetch calls? is that necessary? that's hard and that's
    // why the test is failing.
  })
})