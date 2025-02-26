///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsGeneralEn general = TranslationsGeneralEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsEventsEn events = TranslationsEventsEn._(_root);
	late final TranslationsOrderEn order = TranslationsOrderEn._(_root);
	late final TranslationsTicketsEn tickets = TranslationsTicketsEn._(_root);
	late final TranslationsNotificationEn notification = TranslationsNotificationEn._(_root);
	late final TranslationsBalanceEn balance = TranslationsBalanceEn._(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn._(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn._(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);
}

// Path: general
class TranslationsGeneralEn {
	TranslationsGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get or => 'or';
	String get welcome => 'Welcome';
	String get welcome_back => 'Welcome back';
	String get discover_events => 'Discover events near you';
	String get search => 'Search';
	String get see_more => 'See more';
	String get description => 'Description';
	String get back_to_home => 'Back to home';
	String get save => 'Save';
	String get close => 'Close';
	String get create => 'Create';
	String get update => 'Update';
	String get delete => 'Delete';
	String get person => 'person';
	String get total => 'Total';
	String get ticket => 'Ticket';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Home';
	String get popular_events => 'Popular events';
	String get recommended_events => 'Recommended events';
	String get search_events => 'Search events';
	String get categories => 'Categories';
}

// Path: events
class TranslationsEventsEn {
	TranslationsEventsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get create_event => 'Create event';
	String get update_event => 'Update event';
	String get about => 'About the event';
	String get hosted_by => 'Hosted by';
	String get created_at => 'Created at';
	String get people_going => 'People going';
	String get maximum_participants => 'Maximum participants';
	String get minimum_participants => 'Minimum participants';
	String get min_age => 'Min age';
	String get max_age => 'Max age';
	String get age_group => 'Age group';
	String get all_ages => 'All ages';
	String get get_a_ticket => 'Get a ticket';
	String get total_price => 'Total price';
	late final TranslationsEventsBookingEn booking = TranslationsEventsBookingEn._(_root);
	late final TranslationsEventsDeleteEn delete = TranslationsEventsDeleteEn._(_root);
	late final TranslationsEventsFormEn form = TranslationsEventsFormEn._(_root);
}

// Path: order
class TranslationsOrderEn {
	TranslationsOrderEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get success => 'Order successfully';
	String get your_payment => 'Your payment is successfull';
	String get check_tickets => 'Please check your tickets';
	String get place_order => 'Place order';
	String get book_now => 'Book now';
	String get view_tickets => 'View tickets';
}

// Path: tickets
class TranslationsTicketsEn {
	TranslationsTicketsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get your_tickets => 'Your Tickets';
	String get upcoming_events => 'Upcoming Events';
	String get history => 'History';
	String get no_events => 'There are no\n upcoming events yet';
	String get no_history => 'There are no\n past events yet';
	String get dont_miss => 'Don\'t miss the chance to catch\n your favorite show';
	String get get_your_tickets => 'Get your tickets now';
	String get my_ticket => 'My ticket';
	String get download_ticket => 'Download ticket';
	String get title => 'Tickets';
}

// Path: notification
class TranslationsNotificationEn {
	TranslationsNotificationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Notification';
	String get no_notification => 'No notification';
	String get no_notification_description => 'You have no notification yet';
}

// Path: balance
class TranslationsBalanceEn {
	TranslationsBalanceEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get wallet => 'Wallet';
	String get title => 'Balance';
	String get your_balance => 'Your balance';
	String get send => 'Send';
	String get receive => 'Receive';
	String get buy => 'Buy';
	String get swap => 'Swap';
	String get recent_transactions => 'Recent transactions';
	String get no_history => 'There are no\n past transaction yet';
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Profile';
	String get joined_events => 'Joined events';
	String get joined_events_description => 'See all the events you have joined';
	String get hosted_events => 'Hosted events';
	String get hosted_events_description => 'See all the events you have hosted';
	late final TranslationsProfileDeleteEn delete = TranslationsProfileDeleteEn._(_root);
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAuthLoginEn login = TranslationsAuthLoginEn._(_root);
	late final TranslationsAuthSignupEn signup = TranslationsAuthSignupEn._(_root);
	late final TranslationsAuthForgotPasswordEn forgot_password = TranslationsAuthForgotPasswordEn._(_root);
	late final TranslationsAuthRegisterEn register = TranslationsAuthRegisterEn._(_root);
	late final TranslationsAuthProvidersEn providers = TranslationsAuthProvidersEn._(_root);
	late final TranslationsAuthChangePasswordEn change_password = TranslationsAuthChangePasswordEn._(_root);
	late final TranslationsAuthLogoutEn logout = TranslationsAuthLogoutEn._(_root);
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get generic => 'An error occurred, please try again later';
	String get not_allowed => 'Operation not allowed';
	String get too_many_requests => 'Too many requests, please try again later';
	String get image_error => 'Error loading image';
	late final TranslationsErrorsValidationEn validation = TranslationsErrorsValidationEn._(_root);
	late final TranslationsErrorsAuthEn auth = TranslationsErrorsAuthEn._(_root);
	late final TranslationsErrorsUserEn user = TranslationsErrorsUserEn._(_root);
}

// Path: events.booking
class TranslationsEventsBookingEn {
	TranslationsEventsBookingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get success => 'Order successfully';
	String get payment_successfull => 'Your payment is successfull';
	String get check_tickets => 'Please check your tickets';
	String get book_now => 'Book now';
	String get view_ticket => 'View ticket';
	String get order_summary => 'Order summary';
	String get buy_more_flows => 'Buy more flows';
}

// Path: events.delete
class TranslationsEventsDeleteEn {
	TranslationsEventsDeleteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Delete event';
	String get description => 'Are you sure you want to delete this event? This action cannot be undone.';
	String get success => 'Event successfully deleted';
	late final TranslationsEventsDeleteImageEn image = TranslationsEventsDeleteImageEn._(_root);
}

// Path: events.form
class TranslationsEventsFormEn {
	TranslationsEventsFormEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Title';
	String get category => 'Category';
	String get type => 'Type';
	String get start_date => 'Start date';
	String get end_date => 'End date';
	String get location => 'Location';
	String get price => 'Price';
	String get enable_comments => 'Enable comments';
	String get min_age => 'Min age';
	String get max_age => 'Max age';
	String get description => 'Description';
	String get gender => 'Gender';
	String get create_event => 'Create event';
	String get is_public => 'Is public';
	String get is_online => 'Is online';
	String get max_participants => 'Max participants';
	String get min_participants => 'Min participants';
	String get upload_photos => 'Upload photos';
	String get up_to => 'Up to ({number})';
	String get open_to_all_ages => 'Open to all ages';
}

// Path: profile.delete
class TranslationsProfileDeleteEn {
	TranslationsProfileDeleteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get delete_profile => 'Delete profile';
	String get delete_profile_description => 'Are you sure you want to delete your profile?';
	String get all_data_will_be_deleted => 'All your data will be losted, your events wont\'t be deleted';
}

// Path: auth.login
class TranslationsAuthLoginEn {
	TranslationsAuthLoginEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Login';
	String get no_account => 'Don\'t have an account?';
	String get forgot_password => 'Forgot password?';
}

// Path: auth.signup
class TranslationsAuthSignupEn {
	TranslationsAuthSignupEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sign up';
	String get already_have_account => 'Already have an account?';
}

// Path: auth.forgot_password
class TranslationsAuthForgotPasswordEn {
	TranslationsAuthForgotPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Forgot password';
	String get send => 'Send';
}

// Path: auth.register
class TranslationsAuthRegisterEn {
	TranslationsAuthRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Register';
}

// Path: auth.providers
class TranslationsAuthProvidersEn {
	TranslationsAuthProvidersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get google => 'Continue with Google';
	String get facebook => 'Continue with Facebook';
	String get apple => 'Continue with Apple';
}

// Path: auth.change_password
class TranslationsAuthChangePasswordEn {
	TranslationsAuthChangePasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Change password';
	String get new_password => 'New password';
	String get confirm_password => 'Confirm password';
	String get change => 'Change';
}

// Path: auth.logout
class TranslationsAuthLogoutEn {
	TranslationsAuthLogoutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Logout';
	String get message => 'Are you sure you want to logout?';
}

// Path: errors.validation
class TranslationsErrorsValidationEn {
	TranslationsErrorsValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsErrorsValidationPasswordEn password = TranslationsErrorsValidationPasswordEn._(_root);
	late final TranslationsErrorsValidationEmailEn email = TranslationsErrorsValidationEmailEn._(_root);
	String get title_required => 'Title is required';
	String get category_required => 'Category is required';
	String get type_required => 'Type is required';
	String get start_date_required => 'Start date is required';
	String get end_date_required => 'End date is required';
	String get location_required => 'Location is required';
	String get price_required => 'Price is required';
	String get min_age_required => 'Min age is required';
	String get max_age_required => 'Max age is required';
	String get description_required => 'Description is required';
	String get min_participants_required => 'Min participants is required';
	String get max_participants_required => 'Max participants is required';
	String get gender_required => 'Gender is required';
	String get required => 'This field is required';
	String get invalid => 'Invalid value';
	String get generic_error => 'You are missing some required fields, please check your data';
}

// Path: errors.auth
class TranslationsErrorsAuthEn {
	TranslationsErrorsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get wrong_credentials => 'Wrong email or password';
	String get email_already_exists => 'Email already exists';
	String get invalid_email => 'Invalid email';
	String get user_disabled => 'User is disabled';
}

// Path: errors.user
class TranslationsErrorsUserEn {
	TranslationsErrorsUserEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get not_found => 'User not found';
	String get updating_user => 'An error occurred while updating your data';
	String get updating_user_photo => 'An error occurred while updating your profile image';
	String get deleting_user => 'An error occurred while deleting your account';
	String get searching_username => 'An error occurred while verifying username';
}

// Path: events.delete.image
class TranslationsEventsDeleteImageEn {
	TranslationsEventsDeleteImageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Delete Image';
	String get description => 'Are you sure you want to delete this image?';
	String get success => 'Image successfully deleted';
}

// Path: errors.validation.password
class TranslationsErrorsValidationPasswordEn {
	TranslationsErrorsValidationPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get required => 'Password is required';
	String get min_length => 'Password must be at least 8 characters long';
	String get upper_case => 'Password must contain at least one uppercase letter';
	String get lower_case => 'Password must contain at least one lowercase letter';
	String get digit => 'Password must contain at least one number';
}

// Path: errors.validation.email
class TranslationsErrorsValidationEmailEn {
	TranslationsErrorsValidationEmailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get required => 'Email is required';
	String get invalid => 'Email is invalid';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'general.or': return 'or';
			case 'general.welcome': return 'Welcome';
			case 'general.welcome_back': return 'Welcome back';
			case 'general.discover_events': return 'Discover events near you';
			case 'general.search': return 'Search';
			case 'general.see_more': return 'See more';
			case 'general.description': return 'Description';
			case 'general.back_to_home': return 'Back to home';
			case 'general.save': return 'Save';
			case 'general.close': return 'Close';
			case 'general.create': return 'Create';
			case 'general.update': return 'Update';
			case 'general.delete': return 'Delete';
			case 'general.person': return 'person';
			case 'general.total': return 'Total';
			case 'general.ticket': return 'Ticket';
			case 'home.title': return 'Home';
			case 'home.popular_events': return 'Popular events';
			case 'home.recommended_events': return 'Recommended events';
			case 'home.search_events': return 'Search events';
			case 'home.categories': return 'Categories';
			case 'events.create_event': return 'Create event';
			case 'events.update_event': return 'Update event';
			case 'events.about': return 'About the event';
			case 'events.hosted_by': return 'Hosted by';
			case 'events.created_at': return 'Created at';
			case 'events.people_going': return 'People going';
			case 'events.maximum_participants': return 'Maximum participants';
			case 'events.minimum_participants': return 'Minimum participants';
			case 'events.min_age': return 'Min age';
			case 'events.max_age': return 'Max age';
			case 'events.age_group': return 'Age group';
			case 'events.all_ages': return 'All ages';
			case 'events.get_a_ticket': return 'Get a ticket';
			case 'events.total_price': return 'Total price';
			case 'events.booking.success': return 'Order successfully';
			case 'events.booking.payment_successfull': return 'Your payment is successfull';
			case 'events.booking.check_tickets': return 'Please check your tickets';
			case 'events.booking.book_now': return 'Book now';
			case 'events.booking.view_ticket': return 'View ticket';
			case 'events.booking.order_summary': return 'Order summary';
			case 'events.booking.buy_more_flows': return 'Buy more flows';
			case 'events.delete.title': return 'Delete event';
			case 'events.delete.description': return 'Are you sure you want to delete this event? This action cannot be undone.';
			case 'events.delete.success': return 'Event successfully deleted';
			case 'events.delete.image.title': return 'Delete Image';
			case 'events.delete.image.description': return 'Are you sure you want to delete this image?';
			case 'events.delete.image.success': return 'Image successfully deleted';
			case 'events.form.title': return 'Title';
			case 'events.form.category': return 'Category';
			case 'events.form.type': return 'Type';
			case 'events.form.start_date': return 'Start date';
			case 'events.form.end_date': return 'End date';
			case 'events.form.location': return 'Location';
			case 'events.form.price': return 'Price';
			case 'events.form.enable_comments': return 'Enable comments';
			case 'events.form.min_age': return 'Min age';
			case 'events.form.max_age': return 'Max age';
			case 'events.form.description': return 'Description';
			case 'events.form.gender': return 'Gender';
			case 'events.form.create_event': return 'Create event';
			case 'events.form.is_public': return 'Is public';
			case 'events.form.is_online': return 'Is online';
			case 'events.form.max_participants': return 'Max participants';
			case 'events.form.min_participants': return 'Min participants';
			case 'events.form.upload_photos': return 'Upload photos';
			case 'events.form.up_to': return 'Up to ({number})';
			case 'events.form.open_to_all_ages': return 'Open to all ages';
			case 'order.success': return 'Order successfully';
			case 'order.your_payment': return 'Your payment is successfull';
			case 'order.check_tickets': return 'Please check your tickets';
			case 'order.place_order': return 'Place order';
			case 'order.book_now': return 'Book now';
			case 'order.view_tickets': return 'View tickets';
			case 'tickets.your_tickets': return 'Your Tickets';
			case 'tickets.upcoming_events': return 'Upcoming Events';
			case 'tickets.history': return 'History';
			case 'tickets.no_events': return 'There are no\n upcoming events yet';
			case 'tickets.no_history': return 'There are no\n past events yet';
			case 'tickets.dont_miss': return 'Don\'t miss the chance to catch\n your favorite show';
			case 'tickets.get_your_tickets': return 'Get your tickets now';
			case 'tickets.my_ticket': return 'My ticket';
			case 'tickets.download_ticket': return 'Download ticket';
			case 'tickets.title': return 'Tickets';
			case 'notification.title': return 'Notification';
			case 'notification.no_notification': return 'No notification';
			case 'notification.no_notification_description': return 'You have no notification yet';
			case 'balance.wallet': return 'Wallet';
			case 'balance.title': return 'Balance';
			case 'balance.your_balance': return 'Your balance';
			case 'balance.send': return 'Send';
			case 'balance.receive': return 'Receive';
			case 'balance.buy': return 'Buy';
			case 'balance.swap': return 'Swap';
			case 'balance.recent_transactions': return 'Recent transactions';
			case 'balance.no_history': return 'There are no\n past transaction yet';
			case 'profile.title': return 'Profile';
			case 'profile.joined_events': return 'Joined events';
			case 'profile.joined_events_description': return 'See all the events you have joined';
			case 'profile.hosted_events': return 'Hosted events';
			case 'profile.hosted_events_description': return 'See all the events you have hosted';
			case 'profile.delete.delete_profile': return 'Delete profile';
			case 'profile.delete.delete_profile_description': return 'Are you sure you want to delete your profile?';
			case 'profile.delete.all_data_will_be_deleted': return 'All your data will be losted, your events wont\'t be deleted';
			case 'auth.login.title': return 'Login';
			case 'auth.login.no_account': return 'Don\'t have an account?';
			case 'auth.login.forgot_password': return 'Forgot password?';
			case 'auth.signup.title': return 'Sign up';
			case 'auth.signup.already_have_account': return 'Already have an account?';
			case 'auth.forgot_password.title': return 'Forgot password';
			case 'auth.forgot_password.send': return 'Send';
			case 'auth.register.title': return 'Register';
			case 'auth.providers.google': return 'Continue with Google';
			case 'auth.providers.facebook': return 'Continue with Facebook';
			case 'auth.providers.apple': return 'Continue with Apple';
			case 'auth.change_password.title': return 'Change password';
			case 'auth.change_password.new_password': return 'New password';
			case 'auth.change_password.confirm_password': return 'Confirm password';
			case 'auth.change_password.change': return 'Change';
			case 'auth.logout.title': return 'Logout';
			case 'auth.logout.message': return 'Are you sure you want to logout?';
			case 'errors.generic': return 'An error occurred, please try again later';
			case 'errors.not_allowed': return 'Operation not allowed';
			case 'errors.too_many_requests': return 'Too many requests, please try again later';
			case 'errors.image_error': return 'Error loading image';
			case 'errors.validation.password.required': return 'Password is required';
			case 'errors.validation.password.min_length': return 'Password must be at least 8 characters long';
			case 'errors.validation.password.upper_case': return 'Password must contain at least one uppercase letter';
			case 'errors.validation.password.lower_case': return 'Password must contain at least one lowercase letter';
			case 'errors.validation.password.digit': return 'Password must contain at least one number';
			case 'errors.validation.email.required': return 'Email is required';
			case 'errors.validation.email.invalid': return 'Email is invalid';
			case 'errors.validation.title_required': return 'Title is required';
			case 'errors.validation.category_required': return 'Category is required';
			case 'errors.validation.type_required': return 'Type is required';
			case 'errors.validation.start_date_required': return 'Start date is required';
			case 'errors.validation.end_date_required': return 'End date is required';
			case 'errors.validation.location_required': return 'Location is required';
			case 'errors.validation.price_required': return 'Price is required';
			case 'errors.validation.min_age_required': return 'Min age is required';
			case 'errors.validation.max_age_required': return 'Max age is required';
			case 'errors.validation.description_required': return 'Description is required';
			case 'errors.validation.min_participants_required': return 'Min participants is required';
			case 'errors.validation.max_participants_required': return 'Max participants is required';
			case 'errors.validation.gender_required': return 'Gender is required';
			case 'errors.validation.required': return 'This field is required';
			case 'errors.validation.invalid': return 'Invalid value';
			case 'errors.validation.generic_error': return 'You are missing some required fields, please check your data';
			case 'errors.auth.wrong_credentials': return 'Wrong email or password';
			case 'errors.auth.email_already_exists': return 'Email already exists';
			case 'errors.auth.invalid_email': return 'Invalid email';
			case 'errors.auth.user_disabled': return 'User is disabled';
			case 'errors.user.not_found': return 'User not found';
			case 'errors.user.updating_user': return 'An error occurred while updating your data';
			case 'errors.user.updating_user_photo': return 'An error occurred while updating your profile image';
			case 'errors.user.deleting_user': return 'An error occurred while deleting your account';
			case 'errors.user.searching_username': return 'An error occurred while verifying username';
			default: return null;
		}
	}
}

