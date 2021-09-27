<?php

class Banners extends CI_Model {

    /*
    return all Bannerss.
    created by your name
    created at 20-08-20.
    */
    public function getAll() {
        return $this->db->get('banners')->result();
    }
    /*
    function for create Banners.
    return Banners inserted id.
    created by your name
    created at 20-08-20.
    */
    public function insert($data) {
        $this->db->insert('banners', $data);
        return $this->db->insert_id();
    }
    /*
    return Banners by id.
    created by your name
    created at 20-08-20.
    */
    public function getDataById($id) {
        $this->db->where('id', $id);
        return $this->db->get('banners')->result();
    }
    /*
    function for update Banners.
    return true.
    created by your name
    created at 20-08-20.
    */
    public function update($id,$data) {
        $this->db->where('id', $id);
        $this->db->update('banners', $data);
        return true;
    }
    /*
    function for delete Banners.
    return true.
    created by your name
    created at 20-08-20.
    */
    public function delete($id) {
        $this->db->where('id', $id);
        $this->db->delete('banners');
        return true;
    }
    /*
    function for change status of Banners.
    return activated of deactivated.
    created by your name
    created at 20-08-20.
    */
    public function changeStatus($id) {
        $table=$this->getDataById($id);
             if($table[0]->status==0)
             {
                $this->update($id,array('status' => '1'));
                return "Activated";
             }else{
                $this->update($id,array('status' => '0'));
                return "Deactivated";
             }
    }

}