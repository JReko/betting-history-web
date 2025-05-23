import asyncio
from pyppeteer import launch

asyncio.get_event_loop().run_until_complete(login_pinnacle())

async def login_pinnacle():
    # Launch the browser
    browser = await launch(headless=False)  # Set headless=True for headless mode
    page = await browser.newPage()

    # Navigate to Pinnacle's login page
    await page.goto('https://www.pinnacle.com/en/login')

    # Wait for the username and password fields to load
    await page.waitForSelector('#loginName')
    await page.waitForSelector('#password')

    # Enter your credentials
    await page.type('#loginName', 'your_username')
    await page.type('#password', 'your_password')

    # Click the login button
    await page.click('button[type="submit"]')

    # Wait for navigation to complete
    await page.waitForNavigation()

    # Perform post-login actions here

    # Close the browser
    await browser.close()
