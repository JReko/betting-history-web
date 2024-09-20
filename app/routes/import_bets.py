import os

from app import app
from flask import render_template, request, redirect, url_for, flash

from app.pinnacle_bet_page_scraper import PinnacleBetPageScraper


@app.route("/auto_import_pinnacle_bets", methods=["GET", "POST"])
def auto_import_pinnacle_bets():
    if request.method == "GET":
        # Call your import function to process the file
        scraper = PinnacleBetPageScraper("/Users/franciscaisse/Downloads/p.htm")
        for x in range(scraper.get_bet_count()):
            scraper.import_bet()

        flash('Bets imported successfully!', 'success')
        return redirect(url_for('todays_bets'))
