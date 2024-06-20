# f4st-donateprotection

f4st-donateprotection is a FiveM script that protects designated vehicles based on player identifiers. Whitelisted players can freely interact with these vehicles, while unauthorized players will find their movement restricted.

## Installation

1. **Clone the Repository:**
   - Clone the repository from GitHub:
     ```bash
     git clone https://github.com/f4st3rxd/f4st-donateprotection.git
     ```

2. **Dependencies:**
   - Ensure you have the following dependency installed:
     - [qb-core](https://github.com/qbcore-framework/qb-core): Core framework for FiveM servers.

3. **Configuration:**
   - Open `config.lua` and adjust settings according to your server setup.
   - Define `Identifiers` to include the identifiers of players who should have vehicle protection.
   - Set `WhitelistCars` with the vehicle models (hash keys) that should be protected.
   - Customize `NotifyText` to change the notification message shown to unauthorized players.

4. **Integration:**
   - Place the `f4st-donateprotection` directory into your FiveM server's `resources` folder.
   - Ensure `start f4st-donateprotection` is added to your `server.cfg` file to load the script on server start.

## Usage

- Whitelisted players (defined in `Identifiers`) can freely drive and move vehicles listed in `WhitelistCars`.
- Unauthorized players attempting to drive protected vehicles will find their movement frozen, with a customizable notification (`NotifyText`) displayed.
