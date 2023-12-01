//
//  ProductViewModel.swift
//  ForTestCode
//
//  Created by Dev on 22/11/2566 BE.
//

import Foundation
import Alamofire

class ProductViewModel:NSObject{
    
    private let reuseIdentifierProductCell = "ProductCell"
    var dataProducts:[ProductModel] = []
    var productTable:UITableView!
    
    func setUI(viewController:UIViewController){
        productTable =  UITableView(frame: CGRect(x: 0, y: viewController.getSaftArea().top + viewController.getNavigationBarHeight() + viewController.getStatusBarHeight(), width: viewController.view.frame.width, height: viewController.view.frame.height - (viewController.getSaftArea().top + viewController.getNavigationBarHeight() + viewController.getStatusBarHeight())))
        productTable.register(UINib(nibName: "ProductViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierProductCell)
        productTable.backgroundColor = .brown
        productTable.dataSource = self
        productTable.delegate = self
        viewController.view.addSubview(productTable)
    }
    
    func getProduct(completionBlock:@escaping(_ setupUI:Bool)->Void)->Void{
        BaseServiceRequest.getDataForURL(urlPath: CustomURL.dummyjsonURL) { successData, errorStr in
            if let err = errorStr{
                print("error -> \(err)")
                completionBlock(false)
            }
            
            if let dataReturn = successData{
                do {
                    let productsModel = try JSONDecoder().decodeToAnyString(ProductsModel.self, from: dataReturn)
                    self.dataProducts = productsModel.products
                    completionBlock(true)
                } catch {
                    print("Catch -> \(error.localizedDescription)")
                    completionBlock(true)
                }
            }else{
                completionBlock(true)
            }
        }
    }
}

extension ProductViewModel:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataProducts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierProductCell, for: indexPath) as! ProductViewCell
        cell.selectionStyle = .none
        cell.setUIProduct(modelProduct: dataProducts[indexPath.row])
        return cell
    }
}
