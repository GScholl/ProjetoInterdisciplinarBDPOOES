/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.awt.Color;
import java.awt.Component;
import java.awt.Graphics;
import java.awt.Insets;
import javax.swing.border.AbstractBorder;

public class BordaRedonda extends AbstractBorder {

    private final Color borderColor;
    private final int borderRadius;

    public BordaRedonda(Color borderColor, int borderRadius) {
        this.borderColor = borderColor;
        this.borderRadius = borderRadius;
    }

    @Override
    public void paintBorder(Component c, Graphics g, int x, int y, int width, int height) {
        g.setColor(borderColor);
        g.drawRoundRect(x, y, width - 1, height - 1, borderRadius, borderRadius);
    }

    @Override
    public Insets getBorderInsets(Component c) {
        return new Insets(borderRadius, borderRadius, borderRadius, borderRadius);
    }

    @Override
    public Insets getBorderInsets(Component c, Insets insets) {
        insets.left = insets.top = insets.right = insets.bottom = borderRadius;
        return insets;
    }
}
