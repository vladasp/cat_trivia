# Flutter Cat Facts App

This Flutter app fetches random cat facts from the Cat Facts API and displays them along with corresponding cat images. It utilizes the BLoC pattern for state management, the Retrofit package for API communication, and Hive for local data storage on the device.

## Required Dependencies

- Flutter BLoC package for state management.
- Retrofit package for API communication.
- Hive for local data storage.

## Usage

1. On app start, a random cat fact and image will be displayed.
2. Press the 'Another fact!' button to load and show a new random cat fact and image.
3. While the fact and image are loading, a loading animation will be shown.
4. To view the saved fact history, press the 'Fact history' button, which will navigate to a new screen listing all the previously displayed facts.
5. To view saved fact details:
   - In the 'Fact history' screen, tap on a previously saved fact to see its full details, including the cat fact text, creation date, and corresponding cat image (if available).
   - To go back to the 'Fact history' screen, use the provided navigation option.

## Demo Video

Please find the demo video of the working application [here](https://1drv.ms/f/s!AhZHJ7mmcU83g_RbgQNFauIkkf6Yyg?e=xXroyx).

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For any inquiries or questions, please contact me at <vladalogin@gmail.com>.

Thank you and happy coding!
