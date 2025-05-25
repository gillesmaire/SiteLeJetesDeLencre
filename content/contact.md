+++
+++

  <div class="form-container">
        <h2>Formulaire de Contact</h2>
        <form action="https://formspree.io/f/mnndkvlj" method="post">
            <div class="form-row">
                <label for="prenom">Prénom:</label>
                <input type="text" id="prenom" name="prenom" required>
            </div>
            <div class="form-row">
                <label for="nom">Nom:</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            <div class="form-row">
                <label for="telephone">Téléphone:</label>
                <input type="tel" id="telephone" name="telephone" required>
            </div>
            <div class="form-row">
                <label for="email">E-mail:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-row">
                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" required></textarea>
            </div>
            <button type="submit">Envoyer</button>
        </form>
    </div>
