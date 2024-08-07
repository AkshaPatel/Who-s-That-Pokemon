//
//  QuizPageViewController.swift
//  Who's That Pokemon?
//
//  Created by Aksh Patel on 11/10/23.
//

import UIKit

class QuizPageViewController: UIViewController {
    
    var randomPokemonNumber = Int.random(in: 1...1017)
    var correctAnswerChoice = Int.random(in: 0...3)
    var PokemonName: String = "ErrorPokeName"
    var answerChoices = ["Error", "Error", "Error", "Error"]
    @IBOutlet var PokemonImage: UIImageView?
    @IBOutlet var Choice0: UIButton?
    @IBOutlet var Choice1: UIButton?
    @IBOutlet var Choice2: UIButton?
    @IBOutlet var Choice3: UIButton?
    @IBOutlet var Score: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://pokeapi.co/api/v2/pokemon-form/\(randomPokemonNumber)"
        extractData(from: url)
        setUpButtons()
        Score?.text = "0"
    }
    
    private func extractData(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self]data, response, error in
            guard let data = data, error == nil else {
                print("Error: something went wrong")
                return
            }
            // have data
            var results: PokeData?
            do {
                results = try JSONDecoder().decode(PokeData.self, from: data)
            }
            catch {
                print("Failed to convert: \(error)")
            }
            
            guard let json = results else {
                return
            }
            
            // Set the pokemon name
            PokemonName.self = json.name
            
            // Set up the pokemon image in the image view
            var img_url: URL
            if let image = json.sprites["front_default"] {
                img_url = URL(string: image ?? "")!
                    
            } else {
                img_url = URL(string: "https://www.computerhope.com/jargon/e/error.png")!
                print("Empty image")
            }
            
            
            DispatchQueue.global().async {
                    // Fetch Image Data
                    if let Imgdata = try? Data(contentsOf: img_url) {
                        DispatchQueue.main.async {
                            // Create Image and Update Image View
                            self.PokemonImage?.image = UIImage(data: Imgdata)
                            
                            // Set correct answer button
                            if (self.correctAnswerChoice == 0) {
                                self.Choice0?.setTitle(self.PokemonName, for: .normal)
                            }
                            else if (self.correctAnswerChoice == 1) {
                                self.Choice1?.setTitle(self.PokemonName, for: .normal)
                            }
                            else if (self.correctAnswerChoice == 2) {
                                self.Choice2?.setTitle(self.PokemonName, for: .normal)
                            }
                            else {
                                self.Choice3?.setTitle(self.PokemonName, for: .normal)
                            }
                            
                        }
                    }
                }
            
        })
            task.resume()
    }
    
    
    func setRandomPokemonName(buttonNumber: Int) {
        let randomInt = Int.random(in: 1...1017)
        let newURL = "https://pokeapi.co/api/v2/pokemon-form/\(randomInt)"
        
        // Get a random Pokemon name
        let datatask = URLSession.shared.dataTask(with: URL(string: newURL)!, completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                print("Error: something went wrong")
                return
            }
            // have data
            var results: PokeName?
            do {
                results = try JSONDecoder().decode(PokeName.self, from: data)
            }
            catch {
                print("Failed to convert: \(error)")
            }
            
 
            
            
            DispatchQueue.global().async {
                    // Fetch Name Data
                if let json = results {
                        DispatchQueue.main.async {
                            // Set Button With Name
                            if (buttonNumber == 0) {
                                self.Choice0?.setTitle(json.name, for: .normal)
                            }
                            else if (buttonNumber == 1) {
                                self.Choice1?.setTitle(json.name, for: .normal)
                            }
                            else if (buttonNumber == 2) {
                                self.Choice2?.setTitle(json.name, for: .normal)
                            }
                            else {
                                self.Choice3?.setTitle(json.name, for: .normal)
                            }
                            
                        }
                    }
                }
            
        })
        datatask.resume()
    }
    
    
    func setUpButtons() {
        
        for i in 0...3 {
            if (i == self.correctAnswerChoice) {}
            else {
                setRandomPokemonName(buttonNumber: i)
            }
        }
    }
    
    
    @IBAction func Button0Chosen() {
        if (correctAnswerChoice == 0) {
            let currentScore: Int? = Int(Score?.text ?? "0")
            Score?.text = "\((currentScore ?? 0) + 10)"
            
            // New Pokemon
            self.randomPokemonNumber = Int.random(in: 1...1017)
            let url = "https://pokeapi.co/api/v2/pokemon-form/\(randomPokemonNumber)"
            extractData(from: url)
            setUpButtons()
        }
        else {
            performSegue(withIdentifier: "WrongChoice", sender: self)
        }
    }
    
    @IBAction func Button1Chosen() {
        if (correctAnswerChoice == 1) {
            let currentScore: Int? = Int(Score?.text ?? "0")
            Score?.text = "\((currentScore ?? 0) + 10)"
            
            // New Pokemon
            self.randomPokemonNumber = Int.random(in: 1...1017)
            let url = "https://pokeapi.co/api/v2/pokemon-form/\(randomPokemonNumber)"
            extractData(from: url)
            setUpButtons()
        }
        else {
            performSegue(withIdentifier: "WrongChoice", sender: self)
        }
    }
    
    @IBAction func Button2Chosen() {
        if (correctAnswerChoice == 2) {
            let currentScore: Int? = Int(Score?.text ?? "0")
            Score?.text = "\((currentScore ?? 0) + 10)"
            
            // New Pokemon
            self.randomPokemonNumber = Int.random(in: 1...1017)
            let url = "https://pokeapi.co/api/v2/pokemon-form/\(randomPokemonNumber)"
            extractData(from: url)
            setUpButtons()
        }
        else {
            performSegue(withIdentifier: "WrongChoice", sender: self)
        }
    }
    
    @IBAction func Button3Chosen() {
        if (correctAnswerChoice == 3) {
            let currentScore: Int? = Int(Score?.text ?? "0")
            Score?.text = "\((currentScore ?? 0) + 10)"
            
            // New Pokemon
            self.randomPokemonNumber = Int.random(in: 1...1017)
            let url = "https://pokeapi.co/api/v2/pokemon-form/\(randomPokemonNumber)"
            extractData(from: url)
            setUpButtons()
        }
        else {
            performSegue(withIdentifier: "WrongChoice", sender: self)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}

struct PokeName: Codable {
    let name: String
}

struct PokeData: Codable {
    let name: String
    var sprites = [String: String?]()
}
