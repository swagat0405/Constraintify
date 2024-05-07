//
//  UIView+Constraints.swift
//  Contraintify
//
//  Created by Swagat Mishra on 5/1/24.
//

import UIKit

extension UIView {
    func anchor(_ anchor: NSLayoutXAxisAnchor, to: NSLayoutXAxisAnchor, multipler: CGFloat, relation: ConstraintRelation, priority: UILayoutPriority, identifier: String?) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint
        switch relation {
        case .lessThanEqualTo:
            constraint = anchor.constraint(lessThanOrEqualToSystemSpacingAfter: to, multiplier: multipler)
        case .equalTo:
            constraint = anchor.constraint(equalToSystemSpacingAfter: to, multiplier: multipler)
        case .greaterThanEqualTo:
            constraint = anchor.constraint(greaterThanOrEqualToSystemSpacingAfter: to, multiplier: multipler)
        }
        constraint.priority = priority
        constraint.identifier = identifier
        return constraint
    }
    
    func anchor(_ anchor: NSLayoutYAxisAnchor, to: NSLayoutYAxisAnchor, multipler: CGFloat, relation: ConstraintRelation, priority: UILayoutPriority, identifier: String?) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint
        switch relation {
        case .lessThanEqualTo:
            constraint = anchor.constraint(lessThanOrEqualToSystemSpacingBelow: to, multiplier: multipler)
        case .equalTo:
            constraint = anchor.constraint(equalToSystemSpacingBelow: to, multiplier: multipler)
        case .greaterThanEqualTo:
            constraint = anchor.constraint(greaterThanOrEqualToSystemSpacingBelow: to, multiplier: multipler)
        }
        constraint.priority = priority
        constraint.identifier = identifier
        return constraint
    }
    
    func anchor(_ anchor: NSLayoutXAxisAnchor, to: NSLayoutXAxisAnchor, constant: CGFloat, relation: ConstraintRelation, priority: UILayoutPriority, identifier: String?) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint
        switch relation {
        case .lessThanEqualTo:
            constraint = anchor.constraint(lessThanOrEqualTo: to, constant: constant)
        case .equalTo:
            constraint = anchor.constraint(equalTo: to, constant: constant)
        case .greaterThanEqualTo:
            constraint = anchor.constraint(greaterThanOrEqualTo: to, constant: constant)
        }
        constraint.priority = priority
        constraint.identifier = identifier
        return constraint
    }
    
    func anchor(_ anchor: NSLayoutYAxisAnchor, to: NSLayoutYAxisAnchor, constant: CGFloat, relation: ConstraintRelation, priority: UILayoutPriority, identifier: String?) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint
        switch relation {
        case .lessThanEqualTo:
            constraint = anchor.constraint(lessThanOrEqualTo: to, constant: constant)
        case .equalTo:
            constraint = anchor.constraint(equalTo: to, constant: constant)
        case .greaterThanEqualTo:
            constraint = anchor.constraint(greaterThanOrEqualTo: to, constant: constant)
        }
        constraint.priority = priority
        constraint.identifier = identifier
        return constraint
    }
    
    func anchor(_ anchor: NSLayoutDimension, to: NSLayoutDimension? = nil, relation: ConstraintRelation, multiplier: CGFloat, constant: CGFloat, priority: UILayoutPriority, identifer: String?) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint
        switch relation {
        case .lessThanEqualTo:
            if let anchorTo = to {
                constraint = anchor.constraint(lessThanOrEqualTo: anchorTo, multiplier: multiplier, constant: constant)
            } else {
                constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
            }
        case .equalTo:
            if let anchorTo = to {
                constraint = anchor.constraint(equalTo: anchorTo, multiplier: multiplier, constant: constant)
            } else {
                constraint = anchor.constraint(equalToConstant: constant)
            }
        case .greaterThanEqualTo:
            if let anchorTo = to {
                constraint = anchor.constraint(greaterThanOrEqualTo: anchorTo, multiplier: multiplier, constant: constant)
            } else {
                constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
            }
        }
        constraint.priority = priority
        constraint.identifier = identifer
        return constraint
    }
    
    @discardableResult func anchorAxis(
        centerX: NSLayoutXAxisAnchor? = nil,
        centerY: NSLayoutYAxisAnchor? = nil,
        centerXConstant: CGFloat = 0.0,
        centerYConstant: CGFloat = 0.0,
        centerXMultiplier: CGFloat? = nil,
        centerYMultiplier: CGFloat? = nil,
        centerXPriority: UILayoutPriority = .defaultHigh,
        centerYPriority: UILayoutPriority = .defaultHigh,
        centerXRelation: ConstraintRelation = .equalTo,
        centerYRelation: ConstraintRelation = .equalTo,
        centerXIdentifier: String? = nil,
        centerYIdentifier: String? = nil
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        if let centerX = centerX {
            if let multiplier = centerXMultiplier {
                constraints.append(anchor(centerXAnchor, to: centerX, multipler: multiplier, relation: centerXRelation, priority: centerXPriority, identifier: centerXIdentifier))
            } else {
                constraints.append(anchor(centerXAnchor, to: centerX, constant: centerXConstant, relation: centerXRelation, priority: centerXPriority, identifier: centerXIdentifier))
            }
        }
        
        if let centerY = centerY {
            if let multiplier = centerYMultiplier {
                constraints.append(anchor(centerYAnchor, to: centerY, multipler: multiplier, relation: centerYRelation, priority: centerYPriority, identifier: centerYIdentifier))
            } else {
                constraints.append(anchor(centerYAnchor, to: centerY, constant: centerYConstant, relation: centerYRelation, priority: centerYPriority, identifier: centerYIdentifier))
            }
        }
        
        return constraints
    }
    
    @discardableResult func anchorMargins(
        leading: NSLayoutXAxisAnchor? = nil,
        top: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        leadingConstant: CGFloat = 0.0,
        topConstant: CGFloat = 0.0,
        trailingConstant: CGFloat = 0.0,
        bottomConstant: CGFloat = 0.0,
        leadingMultiplier: CGFloat? = nil,
        topMultipler: CGFloat? = nil,
        trailingMutiplier: CGFloat? = nil,
        bottomMultiplier: CGFloat? = nil,
        leadingPriority: UILayoutPriority = .defaultHigh,
        topPriority: UILayoutPriority = .defaultHigh,
        trailingPriority: UILayoutPriority = .defaultHigh,
        bottomPriority: UILayoutPriority = .defaultHigh,
        leadingRelation: ConstraintRelation = .equalTo,
        topRelation: ConstraintRelation = .equalTo,
        trailingRelation: ConstraintRelation = .equalTo,
        bottomRelation: ConstraintRelation = .equalTo,
        leadingIdentifier: String? = nil,
        topIdentifier: String? = nil,
        trailingIdentifier: String? = nil,
        bottomIdentifier: String? = nil
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        if let leading = leading {
            if let multiplier = leadingMultiplier {
                constraints.append(anchor(leadingAnchor, to: leading, multipler: multiplier, relation: leadingRelation, priority: leadingPriority, identifier: leadingIdentifier))
            } else {
                constraints.append(anchor(leadingAnchor, to: leading, constant: leadingConstant, relation: leadingRelation, priority: leadingPriority, identifier: leadingIdentifier))
            }
        }
        
        if let top = top {
            if let multiplier = topMultipler {
                constraints.append(anchor(topAnchor, to: top, multipler: multiplier, relation: topRelation, priority: topPriority, identifier: topIdentifier))
            } else {
                constraints.append(anchor(topAnchor, to: top, constant: topConstant, relation: topRelation, priority: topPriority, identifier: topIdentifier))
            }
        }
        
        if let trailing = trailing {
            if let multiplier = trailingMutiplier {
                constraints.append(anchor(trailingAnchor, to: trailing, multipler: multiplier, relation: trailingRelation, priority: trailingPriority, identifier: trailingIdentifier))
            } else {
                constraints.append(anchor(trailingAnchor, to: trailing, constant: -trailingConstant, relation: trailingRelation, priority: trailingPriority, identifier: trailingIdentifier))
            }
        }
        
        if let bottom = bottom {
            if let multiplier = bottomMultiplier {
                constraints.append(anchor(bottomAnchor, to: bottom, multipler: multiplier, relation: bottomRelation, priority: bottomPriority, identifier: bottomIdentifier))
            } else {
                constraints.append(anchor(bottomAnchor, to: bottom, constant: -bottomConstant, relation: bottomRelation, priority: bottomPriority, identifier: bottomIdentifier))
            }
        }
        
        return constraints
    }
    
    @discardableResult func anchorDimension(
        width: NSLayoutDimension? = nil,
        height: NSLayoutDimension? = nil,
        widthMultiplier: CGFloat = 1.0,
        heightMultiplier: CGFloat = 1.0,
        widthConstant: CGFloat = 0.0,
        heightConstant: CGFloat = 0.0,
        widthPriority: UILayoutPriority = .defaultHigh,
        heightPriority: UILayoutPriority = .defaultHigh,
        widthRelation: ConstraintRelation = .equalTo,
        heightRelation: ConstraintRelation = .equalTo,
        widthIdentifier: String? = nil,
        heightIdentifier: String? = nil
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(contentsOf: [
            anchor(widthAnchor, to: width, relation: widthRelation, multiplier: widthMultiplier, constant: widthConstant, priority: widthPriority, identifer: widthIdentifier),
            anchor(heightAnchor, to: height, relation: heightRelation, multiplier: heightMultiplier, constant: heightConstant, priority: heightPriority, identifer: heightIdentifier)
        ])
        
        return constraints
    }
}

public protocol Constraintify {
    func constraint(
        _ constraints: (() -> [NSLayoutConstraint])?
    )
}

extension UIView: Constraintify {
    public func constraint(
        _ constraints: (() -> [NSLayoutConstraint])? = nil
    ) {
        guard let constraints = constraints?() else { return }
        NSLayoutConstraint.activate(constraints)
    }
}

public extension UIView {
    
    enum ConstraintRelation {
        case greaterThanEqualTo
        case lessThanEqualTo
        case equalTo
    }
    
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }

    @discardableResult func anchorToSuperView() -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }
        return anchor(centerX: superview.centerXAnchor, centerY: superview.centerYAnchor, width: superview.widthAnchor, height: superview.heightAnchor)
    }
    
    @discardableResult func anchor(
        leading: NSLayoutXAxisAnchor? = nil,
        top: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        centerX: NSLayoutXAxisAnchor? = nil,
        centerY: NSLayoutYAxisAnchor? = nil,
        width: NSLayoutDimension? = nil,
        height: NSLayoutDimension? = nil,
        leadingConstant: CGFloat = 0.0,
        topConstant: CGFloat = 0.0,
        trailingConstant: CGFloat = 0.0,
        bottomConstant: CGFloat = 0.0,
        centerXConstant: CGFloat = 0.0,
        centerYConstant: CGFloat = 0.0,
        widthConstant: CGFloat = 0.0,
        heightConstant: CGFloat = 0.0,
        leadingMultiplier: CGFloat? = nil,
        topMultipler: CGFloat? = nil,
        trailingMutiplier: CGFloat? = nil,
        bottomMultiplier: CGFloat? = nil,
        centerXMultiplier: CGFloat? = nil,
        centerYMultiplier: CGFloat? = nil,
        widthMultiplier: CGFloat = 1.0,
        heightMultiplier: CGFloat = 1.0,
        leadingPriority: UILayoutPriority = .defaultHigh,
        topPriority: UILayoutPriority = .defaultHigh,
        trailingPriority: UILayoutPriority = .defaultHigh,
        bottomPriority: UILayoutPriority = .defaultHigh,
        centerXPriority: UILayoutPriority = .defaultHigh,
        centerYPriority: UILayoutPriority = .defaultHigh,
        widthPriority: UILayoutPriority = .defaultHigh,
        heightPriority: UILayoutPriority = .defaultHigh,
        leadingRelation: ConstraintRelation = .equalTo,
        topRelation: ConstraintRelation = .equalTo,
        trailingRelation: ConstraintRelation = .equalTo,
        bottomRelation: ConstraintRelation = .equalTo,
        centerXRelation: ConstraintRelation = .equalTo,
        centerYRelation: ConstraintRelation = .equalTo,
        widthRelation: ConstraintRelation = .equalTo,
        heightRelation: ConstraintRelation = .equalTo,
        leadingIdentifier: String? = nil,
        topIdentifier: String? = nil,
        trailingIdentifier: String? = nil,
        bottomIdentifier: String? = nil,
        centerXIdentifier: String? = nil,
        centerYIdentifier: String? = nil,
        widthIdentifier: String? = nil,
        heightIdentifier: String? = nil
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        
        constraints.append(
            contentsOf:
                anchorMargins(
                    leading: leading,
                    top: top,
                    trailing: trailing,
                    bottom: bottom,
                    leadingConstant: leadingConstant,
                    topConstant: topConstant,
                    trailingConstant: trailingConstant,
                    bottomConstant: bottomConstant,
                    leadingPriority: leadingPriority,
                    topPriority: topPriority,
                    trailingPriority: trailingPriority,
                    bottomPriority: bottomPriority,
                    leadingRelation: leadingRelation,
                    topRelation: topRelation,
                    trailingRelation: trailingRelation,
                    bottomRelation: bottomRelation,
                    leadingIdentifier: leadingIdentifier,
                    topIdentifier: topIdentifier,
                    trailingIdentifier: trailingIdentifier,
                    bottomIdentifier: bottomIdentifier
                )
        )
        
        constraints.append(
            contentsOf:
                anchorDimension(
                width: width,
                height: height,
                widthMultiplier: widthMultiplier,
                heightMultiplier: heightMultiplier,
                widthConstant: widthConstant,
                heightConstant: heightConstant,
                widthPriority: widthPriority,
                heightPriority: heightPriority,
                widthRelation: widthRelation,
                heightRelation: heightRelation,
                widthIdentifier: widthIdentifier,
                heightIdentifier: heightIdentifier
            )
        )
        
        constraints.append(
            contentsOf:
                anchorAxis(
                    centerX: centerX,
                    centerY: centerY,
                    centerXConstant: centerXConstant,
                    centerYConstant: centerYConstant,
                    centerXPriority: centerXPriority,
                    centerYPriority: centerYPriority,
                    centerXRelation: centerXRelation,
                    centerYRelation: centerYRelation,
                    centerXIdentifier: centerXIdentifier,
                    centerYIdentifier: centerYIdentifier
                )
        )
        
        return constraints
    }
}
