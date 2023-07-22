package modelDAO;

import configuration.Conexion;
import interfaces.ClienteCRUD;
import interfaces.DepartamentoCRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Cliente;
import model.Departamento;

public class DepartamentoDAO implements DepartamentoCRUD {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Departamento nDepartamento = new Departamento();

    @Override
    public List listar() {
        ArrayList<Departamento> listaDepartamento = new ArrayList<>();
        String sql = "select * from Departamento";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Departamento nuevoDepartamento = new Departamento();
                nuevoDepartamento.setIdDepartamento(rs.getInt("idDepartamento"));
                nuevoDepartamento.setNombreDepartamento(rs.getString("nombreDepartamento"));
                nuevoDepartamento.setCodigoPostal(rs.getString("codigoPostal"));
                nuevoDepartamento.setFechaApertura(rs.getDate("fechaApertura"));
                listaDepartamento.add(nuevoDepartamento);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaDepartamento;
    }

    @Override
    public Departamento buscar(int id) {
        String sql = "select * from Departamento where idDepartamento = " + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nDepartamento.setIdDepartamento(rs.getInt("idDepartamento"));
                nDepartamento.setNombreDepartamento(rs.getString("nombreDepartamento"));
                nDepartamento.setCodigoPostal(rs.getString("codigoPostal"));
                nDepartamento.setFechaApertura(rs.getDate("fechaApertura"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nDepartamento;
    }

    @Override
    public boolean agregar(Departamento depa) {
        String sql = "Insert into Departamento(nombreDepartamento, codigoPostal, fechaApertura) values('" + depa.getNombreDepartamento() + "','" + depa.getCodigoPostal() + "','" + depa.getFechaApertura() + "')";
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception error) {
            error.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editar(Departamento depa) {
        String sql = "Update Departamento set nombreDepartamento = '"+depa.getNombreDepartamento()+"', codigoPostal = '"+depa.getCodigoPostal()
                            +"', fechaApertura = '"+depa.getFechaApertura()+"'where idDepartamento = " + depa.getIdDepartamento();
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
