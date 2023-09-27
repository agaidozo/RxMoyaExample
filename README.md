# RxMoyaExample

Um exemplo simples de como usar as bibliotecas RxSwift e Moya para iOS.

## Instalação
1. Instale o CocoaPods.
1. Abra o terminal e navegue até o diretório do projeto.
1. Execute o seguinte comando para instalar as dependências:

```
pod install
```

## Uso
1. Abra o projeto no Xcode.
1. Execute o projeto no simulador ou em um dispositivo físico.
   
## Explicação
O exemplo consiste em uma tela com um botão e um label. Quando o botão é pressionado, uma solicitação é feita ao endpoint /users da API do GitHub. A resposta da solicitação é então exibida no label.

## Código
O código do exemplo está localizado no arquivo `ViewController.swift`.

```Swift
import UIKit
import RxSwift
import Moya

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Cria uma instância do MoyaProvider
        let provider = MoyaProvider<GitHubAPI>()

        // Faz uma solicitação ao endpoint `/users`
        provider.request(.users)
            .asObservable()
            .subscribe(onNext: { response in
                // Exibe a resposta da solicitação no label
                self.label.text = response.data
            })
            .disposed(by: disposeBag)
    }
}
```

Documentação oficial do RxSwift: https://github.com/ReactiveX/RxSwift  
Documentação oficial do Moya: https://github.com/Moya/Moya  

Data de criação: 2023-09-27  
Autor: Obde Willy
