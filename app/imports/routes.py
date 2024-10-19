import os

from flask import render_template, Blueprint, request, flash, redirect, url_for, abort

from app.pinnacle_bet_page_scraper import PinnacleBetPageScraper

import_bp = Blueprint('imports', __name__)


@import_bp.route("/import_pinnacle_bets", methods=["GET", "POST"])
def import_pinnacle_bets():
    if request.method == "GET":
        return render_template("import_pinnacle_bets.html")
    elif request.method == 'POST':
        # Check if the file is in the request
        if 'betFile' not in request.files:
            flash('No file selected', 'error')
            return redirect(request.url)

        file = request.files['betFile']

        # Check if a file was selected and has a valid filename
        if file.filename == '':
            flash('No file selected', 'error')
            return redirect(request.url)

        # Save the file to a temporary location
        filepath = os.path.join('/tmp', file.filename)
        file.save(filepath)

        # Call your import function to process the file
        scraper = PinnacleBetPageScraper(filepath)
        for x in range(scraper.get_bet_count()):
            result = scraper.import_bet()
            if not result['success']:
                raise Exception(result['error'])

        flash('Bets imported successfully!', 'success')
        return redirect(url_for('bet.todays_bets'))


@import_bp.route("/bet/auto_import_pinnacle_bets", methods=["GET", "POST"])
def auto_import_pinnacle_bets():
    if request.method == "GET":

        # Define the path to the file you want to upload automatically
        predefined_file_path = '/Users/franciscaisse/Downloads/p.htm'

        # Check if the file exists at the specified location
        if not os.path.exists(predefined_file_path):
            abort(400)

        # Use the predefined file path to proceed with the upload
        try:
            scraper = PinnacleBetPageScraper(predefined_file_path)
            for x in range(scraper.get_bet_count()):
                result = scraper.import_bet()
                if not result['success']:
                    raise Exception(result['error'])

            flash('Bets imported successfully!', 'success')
            return redirect(url_for('bet.todays_bets'))
        except Exception as exception_message:
            abort(400, exception_message)
